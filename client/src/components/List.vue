<template>
  <div class="hello">

    <div id="todo-list-example" class="container">
      <div class="row">
        <div class="col-md-6 mx-auto">
          <h1 class="text-center">TODO List App</h1>
          <h1 class="text-center">id usuario:{{iduser}}</h1>
          <form v-on:submit.prevent="addNewTask">
            <label for="tasknameinput">Task Name</label>
            <input v-model="taskname" id="tasknameinput" class="form-control" placeholder="Add New Task">
            <button v-if="this.isEdit == false" type="submit" class="btn btn-success btn-block  mt-3">
              Submit
            </button>
            <button v-else type="button" v-on:click="updateTask()" class="btn btn-primary btn-block  mt-3">
              Update
            </button>
          </form>

          <table class="table">
            <tr v-for="(todo) in todos" v-bind:key="todo.id_task" v-bind:title="todo.task_name">
              <td class="text-left">{{todo.task_name}}</td>
              <td class="text-right">
                <button v-on:click="editTask(todo.task_name, todo.id_task)" class=" btn btn-info ">Edit</button>
                <button v-on:click="deleteTask(todo.id_task)" class=" btn btn-danger ">Delete</button>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
/* eslint-disable */
  import axios from 'axios'/* eslint-disable */
  import jwtDecode from 'jwt-decode'
/* eslint-disable */
  export default {/* eslint-disable */
    data() {
      const token = localStorage.usertoken
    const decoded = jwtDecode(token)
      return {
        todos: [],
        id_task: '',
        taskname: '',
        
        iduser: decoded.id,
        isEdit: false
      }
    },
    mounted() {/* eslint-disable */
      this.getTasks()
    },
    methods: {/* eslint-disable */
      getTasks() {
        axios.get('/users/list').then(
          result => {
            console.log(result.data)
            this.todos = result.data
          },
          error => {
            console.error(error)
          }
        )
      },
      addNewTask() {/* eslint-disable */
        axios.post('/users/list',
          { task_name: this.taskname,
          id_user:this.iduser }
        ).then((res) => {
          this.taskname = ''
          this.getTasks()
          console.log(res)
        }).catch((err) => {
          console.log(err)
        })
      },
/* eslint-disable */
      editTask(title, id_task) {
        this.id_task = id_task
        this.taskname = title
        this.isEdit = true
      },
/* eslint-disable */
      updateTask() {/* eslint-disable */
        axios.put(`/users/list/${this.id_task}`,
          { task_name: this.taskname }
        ).then((res) => {
          this.taskname = ''
          this.isEdit = false/* eslint-disable */
          this.getTasks()/* eslint-disable */
          console.log(res)/* eslint-disable */
        }).catch((err) => {/* eslint-disable */
          console.log(err)/* eslint-disable */
        })/* eslint-disable */
      },/* eslint-disable */
/* eslint-disable */
      deleteTask(id_task) {/* eslint-disable */
        axios.delete(`/users/list/${id_task}`/* eslint-disable */
        ).then((res) => {/* eslint-disable */
          this.taskname = ''/* eslint-disable */
          this.getTasks()/* eslint-disable */
          console.log(res)/* eslint-disable */
        }).catch((err) => {/* eslint-disable */
          console.log(err)/* eslint-disable */
        })/* eslint-disable */
      }/* eslint-disable */
    }/* eslint-disable */
  }/* eslint-disable */
  /* eslint-disable */
  // eslint-disable-next-line
</script>
