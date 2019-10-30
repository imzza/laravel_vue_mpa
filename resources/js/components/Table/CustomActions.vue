  <template>
    <div class="custom-actions">
      <button class="btn btn-primary btn-sm" @click="itemAction('view-item', rowData, rowIndex)"><i class="fa fa-eye"></i></button>
      <button class="btn btn-primary btn-sm" @click="itemAction('edit-item', rowData, rowIndex)"><i class="fa fa-pencil"></i></button>
      <button class="btn btn-primary btn-sm" @click="itemAction('delete-item', rowData, rowIndex)"><i class="fa fa-trash"></i></button>
    </div>
  </template>

  <script>
  export default {
    props: {
      rowData: {
        type: Object,
        required: true
      },
      rowIndex: {
        type: Number
      }
    },
    methods: {
      itemAction (action, data, index) {
        console.log('custom-actions: ' + action, data, index)
      }
    }
  }
  </script>

  <style>
    .custom-actions button.ui.button {
      padding: 8px 8px;
    }
    .custom-actions button.ui.button > i.icon {
      margin: auto !important;
    }
  </style>
