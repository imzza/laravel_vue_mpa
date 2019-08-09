<template>
    <div class="row justify-content-center mt-5">
        <div class="col-10">
            <div class="row popover-header">

            </div>
            <div class="row">
                <table class="table col-12">
                    <thead>
                        <tr>
                          <th scope="col">#</th>
                          <th scope="col">First</th>
                          <th scope="col">Last</th>
                          <th scope="col">Handle</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                          <th scope="row">1</th>
                          <td>Mark</td>
                          <td>Otto</td>
                          <td>@mdo</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>

    </div>
</template>

<script>
export default {

  name: 'SampleComponent',

  data () {
    return {

    }
  },
  mounted(){
    axios.get(API_URL+'students')
        .then(resp =>{
            if (resp.status == 200) {
                console.log(resp);
            }else{
                console.log('error');
            }
        }).catch(err =>{
            console.log('error');
        });
  }
}
</script>

<style>
</style>
