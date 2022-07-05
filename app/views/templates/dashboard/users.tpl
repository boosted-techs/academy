
{extends file="dashboard/index.tpl"}
{block name="body"}
    <div class="text-center mb-2 mt-2">
        <h4>You are welcome - {$user_info.0.names}</h4>
    </div>
    <div >
        <table class="table">
            <thead>
            <tr>
                <th></th>
                <th></th>
                <th>Names</th>
                <Th>Email</Th>
                <th>Gender</th>
                <th>DOB</th>
            </tr>
            </thead>
            <tbody>
            {foreach $users item=list name=i}
                <tr>
                    <td>{$smarty.foreach.i.index + 1}</td>
                    <td><img src="{$list.image}" style="width:50px" /></td>
                    <td><a href="//{$smarty.server.SERVER_NAME}/bio?u={$list.username}">{$list.names}</a></td>
                    <td>{$list.email}</td>
                    <td>{if $list.gender == 1}Male{elseif $list.gender == 2}Female{else}Not specified{/if}</td>
                    <td>{$list.dob} ({$list.dob})</td>
                </tr>
            {/foreach}
            </tbody>
        </table>
    </div>
{/block}