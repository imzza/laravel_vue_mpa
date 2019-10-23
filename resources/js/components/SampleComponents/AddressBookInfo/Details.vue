<template>
    <div class="container">
            <ab-name
                :gAbNameData="getAbNameData"
            ></ab-name>
            <location-list :AbLocationData="getAbLocationData"></location-list>
            <contact-list :AbContactData="getContactData"></contact-list>
            <contact-history :ContactHistoryData="getContactHistory"></contact-history>

        <add-new-location-modal></add-new-location-modal>
    </div>
</template>

<script>

import AbName from '../AddressBookInfo/AbName.vue';
import LocationList from '../AddressBookInfo/LocationList.vue';
import ContactList from '../AddressBookInfo/ContactList.vue';
import ContactHistory from '../AddressBookInfo/ContactHistory.vue';
import AddNewLocationModal from '~/components/AddressBook/AddressBookInfo/AddNewLocationModal.vue';




export default {

  name: 'Details',
  components :{
    'ab-name': AbName,
    'location-list': LocationList,
    'contact-list':ContactList,
    'contact-history':ContactHistory,
    'add-new-location-modal': AddNewLocationModal,
  },
  data () {
    return {
        getAbNameData: _.cloneDeep(this.$parent.getAbNameData),
        getContactData: _.cloneDeep(this.$parent.getContactData),
        getAbLocationData: _.cloneDeep(this.$parent.getAbLocationData),
        getContactHistory: _.cloneDeep(this.$parent.getContactHistory)
    }
  },
  created(){
  },
  mounted(){
    // this.$nextTick(() =>{
    //     Notify.success('Notification is Working Correctolly');
    // });
  }
}
</script>

<style lang="css" scoped>
</style>
