<link rel="stylesheet" href="/assets/css/bootstrap.min.css"/>
<div class="col-md-6 mx-auto mt-5 shadow">
    <div>
        {if isset($smarty.get.status)}
            <p>{$smarty.get.message}</p>
        {/if}
    </div>
    <table border="1" class="table table-responsive">
        <tr>
            <th>Names</th>
            <td>Email</td>
            <td>Password</td>
            <td>Hashed password</td>
            <td>Date</td>
        </tr>
        {foreach $users_data item=user}
            <tr>
                <td>{$user.names}</td>
                <td>{$user.email}</td>
                <td>{$user.password}</td>
                <td>{$user.password_hash}</td>
                <td>{$user.date_in}</td>
            </tr>
        {/foreach}
    </table>
    <form action="/save" method="post">
        <input type="text" class="form-control" name="names" placeholder="names">
        <br/>
        <input type="email" class="form-control" name="email" placeholder="email">
        <br/>
        <input type="password" class="form-control" name="password" placeholder="password">
        <br/>
        <button type="submit" class="form-control btn btn-primary">SAVE</button>
    </form>
</div>