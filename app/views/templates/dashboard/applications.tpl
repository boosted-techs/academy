{extends file="dashboard/index.tpl"}
{block name="body"}
    <div class="bg-dark text-white p-2 text-center">
        <h3 class="">APPLICATIONS</h3>
        <button class="btn btn-white" onclick="apply()">APPLY NOW</button>
    </div>
    <div class="col-md-12">
        {if empty($applications)}
            <div class="alert alert-danger text-center">
                You haven't applied to any Program yet.
            </div>
        {else}
            <h4 class="text-center text-info font-weight-bold p-4"><span class="badge-pill badge-success">{count($applications)}</span> Applications</h4>
            {foreach $applications item=list}
            <table class="table mb-4 bg-light">
                <tr>
                    <th>Names</th>
                    <td><img src="{$list.image}" style="width: 50px"/><br/>{$list.names}</td>
                </tr>
                <tr>
                    <th>Program</th>
                    <td><a href="//{$smarty.server.SERVER_NAME}/program/{$list.url}">{$list.program}</td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td class="font-weight-bold">{if $list.status == 0}Pending{elseif $list.status == 1}<span class="fa fa-check-square text-info font-weight-bold"></span> Submitted {elseif $list.status == 2}<span class="fa fa-check-square text-info font-weight-bold"></span>Admitted{elseif $list.status == 3}<span class="fa fa-check-square text-success font-weight-bold"></span>Completed{else}Rejected{/if}</td>
                </tr>
                <tr>
                    <th>Date applied</th>
                    <td>{$list.date_applied}</td>
                </tr>
                <tr>
                    <th>Intake</th>
                    <td>{$list.intake}</td>
                </tr>
                <tr>
                    <th>Order state</th>
                    <td class="font-weight-bold">{if $list.order_state == 0} Not yet paid{else}<span class="fa fa-check-square text-success font-weight-bold"></span> Paid{/if}</td>
                </tr>
                <tr>
                    <th>Payment</th>
                    <td class="font-weight-bold">{if $list.payment_confirmation == 0}Pending payment confirmation{else}Confirmed payments{/if}</td>
                </tr>
                <tr>
                    <th>Remarks</th>
                    <td>{$list.description}</td>
                </tr>
            </table>
            {/foreach}
        {/if}
    </div>
{/block}
{block name="scripts"}
    <script src="https://checkout.flutterwave.com/v3.js"></script>
    <script>
        function makePayment(ref) {
            FlutterwaveCheckout({
                public_key: "{$public_key}",
                tx_ref: ref,
                amount: {$fees},
                currency: "UGX",
                country: "UG",
                payment_options: false,
                redirect_url: // specified redirect URL
                    "http://" + window.location.host + "/payment_progress",
                meta: {
                    consumer_id: {if isset($user_info[0]['id'])}{$user_info[0]['id']} {else}"{$smarty.cookies.temporary_id}_temp"{/if},
                    consumer_mac: "92a3-912ba-1192a",
                },
                customer: {
                    email: "{$user_info[0]['email']}",
                    phone_number: "{$addresses.phone_no}",
                    name: "{if isset($user_info[0]['names'])}{$user_info[0]['names']}{else}{$addresses.company}{/if}",
                },
                callback: function (data) {
                    //console.log(data);
                },
                onclose: function() {
                    window.location = "//" + window.location.host + "/applications?error=cancelled"
                },
                customizations: {
                    title: "Boosted Academy",
                    description: "Completing Boo transaction.",
                    logo: "https://academy.boostedtechs.com/assets/images/logos/logo.png",
                },
            });
        }

        function submitForm() {
            {literal}
            $(this).attr("disabled", "true");
            $.post("//" + window.location.host + "/enroll", {program : $("#program").val(), intake : $("#intake").val(), description: $("#description").val()},
                (data) => {
                    let r = JSON.parse(data);
                    if (r) {
                        //closeOverLay();
                        makePayment(data);
                    } else
                        showOverLay("<div class='alert alert-danger text-center'>You are already having a record with us with this intake. Contact administrator for Help or apply for another intake</div>");
                    console.log(data);
                });
            {/literal}
        }

        function apply(){
            $.get("//" + window.location.host + "/apply", (data) => {
                showOverLay(data);
            });
        }
    </script>
{/block}