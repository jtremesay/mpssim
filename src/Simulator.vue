<script setup lang="ts">
import { ref } from "vue"

let current_step = ref(0)
let is_running = ref(false)

function reset() {
    current_step.value = 0
    is_running.value = false
}

function step() {
    current_step.value++

    if (is_running.value) {
        window.requestAnimationFrame(step)
    }
}
function run() {
    is_running.value = true
    step()
}

function stop() {
    is_running.value = false
}
</script>

<template>
    <button @click="reset()">Reset</button>
    <button @click="step()">Step</button>
    <button v-if="is_running" @click="stop()">Stop</button>
    <button v-else @click="run()">Run</button>
    <span v-if="is_running">Status: running</span>
    <span v-else>Status: pause</span>
    <span>Step: {{ current_step }}</span>
</template>