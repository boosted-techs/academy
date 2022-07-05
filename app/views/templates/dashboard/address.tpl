{extends file="dashboard/index.tpl"}
{block name="body"}
    <div class="text-center mb-2 mt-2">
        <h3 class="text-dark font-weight-bold">BIO</h3>
    </div>
    <div class="col-md-8 mx-auto">
        <h4 class="text-white font-weight-bold bg-info p-2">UPDATE YOUR PROFILE ADDRESS</h4>
        <form action="//{$smarty.server.SERVER_NAME}/profile/update" method="post">
            <div class="mt-4 mb-4">
                <label>Company name</label>
                <input type="text" class="form-control" value="{$addresses.company}" name="company" placeholder="Company name (Optional)" />
            </div>
            <div class="mt-4 mb-4">
                <label>Country</label>
                <select class="form-control" name="country">
                    {foreach $country_list item=list}
                        <option {if $list.status == 0}disabled{/if} {if $addresses.country == $list.id} selected {/if} value="{$list.id}">{$list.country}</option>
                    {/foreach}
                </select>
            </div>
            <div class="mt-4 mb-4">
                <label>Street Address *</label>
                <input type="text" value="{$addresses.street}" required class="form-control" name="street" placeholder="Street address" />
            </div>
            <div class="mt-4 mb-4">
                <label>Town / Village *</label>
                <input type="text" value="{$addresses.village}" required class="form-control" name="town" placeholder="Town or village name" />
            </div>
            <div class="mt-4 mb-4">
                <label>District</label>
                <select class="form-control" name="district">
                    {foreach $district_list item=list}
                        <option {if $addresses.district == $list.id} selected {/if} {if $list.status ==0}disabled{/if} value="{$list.id}">{$list.district}</option>
                    {/foreach}
                </select>
            </div>
            <div class="mt-4 mb-4">
                <label>Phone *</label>
                <input type="text" value="{$addresses.phone_no}" required class="form-control" name="phone" placeholder="Phone number" />
            </div>
            <div class="mt-4 mb-4">
                <label>Postal address</label>
                <input type="text" value="{$addresses.box_no}" class="form-control" name="box" placeholder="Postal Address" />
            </div>
            <div class="mt-4 mb-4">
                <label>Email *</label>
                <input type="email" value="{$addresses.email}" required class="form-control" name="email" placeholder="Email address" />
            </div>
            <h5 class="bg-info p-2 text-white">Parent's Information</h5>
            <div class="mt-4 mb-4">
                <label>Mother's name *</label>
                <input type="text" value="{$addresses.mothers_name}" required class="form-control" name="mothers_name" placeholder="Mother's name" />
            </div>
            <div class="mt-4 mb-4">
                <label>Mother's contact</label>
                <input type="text" value="{$addresses.mothers_contact}" class="form-control" name="mothers_contact" placeholder="Mother's Phone number" />
            </div>
            <div class="mt-4 mb-4">
                <label>Father's name *</label>
                <input type="text" value="{$addresses.fathers_name}" required class="form-control" name="fathers_name" placeholder="Father's names" />
            </div>
            <div class="mt-4 mb-4">
                <label>Father's contact</label>
                <input type="text" value="{$addresses.fathers_contact}" class="form-control" name="fathers_contact" placeholder="Father's Phone number" />
            </div>
            <div class="mt-4 mb-4">
                <label>Highest Level attained</label>
                <select class="form-control" name="highest_level" required>
                    <option value="1">Degree</option>
                    <option value="2">Diploma</option>
                    <option value="3">UACE</option>
                    <option value="4">UCE</option>
                    <option value="5">PLE</option>
                    <option value="6">Others</option>
                </select>
            </div>
            <div class="mt-4 mb-4">
                <label>Recent school attended</label>
                <input type="text" class="form-control" name="recent_school" value="{$addresses.recent_school_attended}" placeholder="Recent school attended"/>
            </div>
            <button class="btn btn-danger mt-4 mb-4 ">Update address</button>
        </form>
    </div>
{/block}