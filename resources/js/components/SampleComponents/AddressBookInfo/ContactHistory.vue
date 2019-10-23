<template>
    <div>
    <div class="title-row d-flex align-items-center my-3">
						<h2>Contact History</h2>
					</div>
					<div class="cusTable table-responsive tabl-sm">
							<table class="table table-striped table-hover">
								<thead>
									<tr>
										<th>Last Contacted</th>
										<th>Last Contacted Method</th>
										<th>Last Contactd Description</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
                                    <tr v-for="(ContactHistory, ind) in ContactHistoryList" :class="`ContactHistory`">
                                      <!-- {{ContactHistory}} -->
									    <td>
											<input class="form-control input-small datepicker " type="text" v-model="ContactHistory.LastContacte" id="LastContacted"  />
										</td>
										<td>
                                            <select class="form-control input-small" id="LastContactedMethod" name="LastContactedMethod" style=" width: 100%;" v-model="ContactHistory.LastContactedMethod">
                                                    <option value="Phone">Phone</option>
                                                    <option value="Email" >Email</option>
                                                    <option value="In Person">In Person</option>
                                            </select>
										</td>
										<td>
											<input class="form-control input-small" type="text" v-model="ContactHistory.LastContactedDescription" id="LastContactedDescription"/>
										</td>

										<td class="btn-td">
				
											<a class="btn btn-danger btn-sm" href="#"><i class="far fa-trash-alt"></i></a>
										</td>
									
									</tr>
								</tbody>
							</table>
					</div>
    </div>
</template>

<script>
export default {

  name: 'ContactHistory',
  props: ['ContactHistoryData'],
  data () {
    return {
		ContactHistoryList: _.cloneDeep(this.ContactHistoryData),
    }
  }
}
</script>

<style lang="css" scoped>
</style>
