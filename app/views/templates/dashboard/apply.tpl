
                <!-- your content here -->
                <div class="col-md-12 bg-white p-4">
                        <div class="text-center p-3">
                            <img src="//{$smarty.server.SERVER_NAME}/assets/images/logos/logo.png" alt="" style="width:150px"/>
                            <br/>
                            <span>www.academy.boostedtechs.com, www.boostedtechs.com
                                <br/><a href="mailto:office@boostedtechs.com">office@boostedtechs.com</a><br/><A href="tel:+256 757 074590">+256 757 074590</A>, <a href="tel:+256 759 800742">+256 759 800742</a>, <a href="tel:+256 788 018846">+256 788 018846</a></span>
                            <h3 class="text-info">APPLICATION FORM</h3>
                        </div>
                        <div class="">
                            <label>Names</label>
                            <input type="text" name="names" class="form-control" disabled value="{$user_info.0.names}"/>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>DOB</label>
                                    <input type="text" class="form-control" disabled name="dob" value="{$user_info.0.dob} - ({$user_info.0.age})"/>
                                </div>
                                <div class="col-md-6">
                                    <label>GENDER</label>
                                    <input type="text" class="form-control" disabled name="gender" value="{if $user_info.0.gender == 1}Male{elseif $user_info.0.gender == 2}Female{else}PREFER NOT TO SAY{/if}"/>
                                </div>
                            </div>
                            <div class="mt-4 mb-4">
                                <label>Company name</label>
                                <input type="text" class="form-control" disabled value="{$addresses.company}" name="company" placeholder="Company name (Optional)" />
                            </div>
                            <div class="row">
                                <h5 class="col-md-12 bg-info p-2 text-white">ADDRESS AND CONTACTS</h5>
                                <div class="col-6 col-md-4 mt-4 mb-4">
                                    <label>Country</label>
                                    <select class="form-control" name="country" disabled>
                                        {foreach $country_list item=list}
                                            <option {if $list.status == 0}disabled{/if} {if $addresses.country == $list.id} selected {/if} value="{$list.id}">{$list.country}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-6 col-md-4 mt-4 mb-4">
                                    <label>Street Address *</label>
                                    <input type="text" value="{$addresses.street}" disabled required class="form-control" name="street" placeholder="Street address" />
                                </div>
                                <div class="col-6 col-md-4 mt-4 mb-4">
                                    <label>Town / Village *</label>
                                    <input type="text" value="{$addresses.village}" disabled required class="form-control" name="town" placeholder="Town or village name" />
                                </div>
                                <div class="col-6 col-md-4 mt-4 mb-4">
                                    <label>District</label>
                                    <select class="form-control" name="district" disabled>
                                        {foreach $district_list item=list}
                                            <option {if $addresses.district == $list.id} selected {/if} {if $list.status ==0}disabled{/if} value="{$list.id}">{$list.district}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-6 col-md-4 mt-4 mb-4">
                                    <label>Phone *</label>
                                    <input type="text" disabled value="{$addresses.phone_no}" required class="form-control" name="phone" placeholder="Phone number" />
                                </div>
                                <div class="col-6 col-md-4 mt-4 mb-4">
                                    <label>Postal address</label>
                                    <input type="text" disabled value="{$addresses.box_no}" class="form-control" name="box" placeholder="Postal Address" />
                                </div>
                                <div class="col-12 col-md-4 mt-4 mb-4">
                                    <label>Email *</label>
                                    <input type="email" disabled value="{$addresses.email}" required class="form-control" name="email" placeholder="Email address" />
                                </div>
                                <h5 class="col-md-12 bg-info p-2 text-white">Parent's Information</h5>
                                <div class="col-6 mt-4 mb-4">
                                    <label>Mother's name *</label>
                                    <input type="text" disabled value="{$addresses.mothers_name}" required class="form-control" name="mothers_name" placeholder="Mother's name" />
                                </div>
                                <div class="col-6 mt-4 mb-4">
                                    <label>Mother's contact</label>
                                    <input type="text" disabled value="{$addresses.mothers_contact}" class="form-control" name="mothers_contact" placeholder="Mother's Phone number" />
                                </div>
                                <div class="col-6 mt-4 mb-4">
                                    <label>Father's name *</label>
                                    <input type="text" disabled value="{$addresses.fathers_name}" required class="form-control" name="fathers_name" placeholder="Father's names" />
                                </div>
                                <div class="col-6 mt-4 mb-4">
                                    <label>Father's contact</label>
                                    <input type="text" disabled value="{$addresses.fathers_contact}" class="form-control" name="fathers_contact" placeholder="Father's Phone number" />
                                </div>
                            </div>
                            <div class="row">
                                <h5 class="col-md-12 bg-info p-2 text-white">Select program</h5>
                                <div class="col-6">
                                    <label>
                                        Program
                                    </label>
                                    <select class="form-control" name="program" id="program">
                                        {foreach $courses item=list}
                                            <option value="{$list.id}">{$list.program}</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-6">
                                    <label>
                                        Intake
                                    </label>
                                    {$months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October",  "November",  "December"]}
                                    <select class="form-control" name="intake" id="intake">
                                        {foreach $months item=list name=month}
                                            {$m = $smarty.foreach.month.index + 1}
                                            {if $m < $dates.month}{continue}{/if}
                                            <option value="{$m}" {if $m == $dates.month}selected{/if}>{$list} {$dates.year} intake</option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-md-12">
                                    <label>Description</label>
                                    <textarea class="form-control" id="description" name="description" placeholder="Any other information you would wish to share with us, may be your expectations, experience etc"></textarea>
                                </div>

                                <div class="bg-dark col-md-12 mt-4 text-center text-white p-2">
                                    <h5>For your application to be submitted, an application / Admission fee of <b>UGX {$fees|number_format:1}</b> is paid.</h5>
                                    <button class="btn btn-info" onclick="submitForm()" id="form-btn">SUBMIT APPLICATION</button>
                                </div>
                            </div>
                        </div>

                </div>
