<template>
    <div class="video-page">
        <Navbar />
        <iframe v-bind:src="video.url" frameborder="0"></iframe>
        <h1>{{video.title}}</h1>
        <p>{{video.uploader.firstName}} {{video.uploader.lastName}}</p>

        <p>{{video.description}}</p>
    </div>
</template>

<script>
import Navbar from './Navbar';
import {plainAxiosInstance} from '../backend/axios';

export default {
    name: "Home",
    components: {
        Navbar
    },
    data() {
        return {
            video: {
                title: "",
                uploader: {},
                url: "",
                description: ""
            }
        }
    }, 
    created() {
        this.fetchData()
    },
    methods: {
        fetchData() {
            plainAxiosInstance.get(`/api/videos/${this.$route.params.videoId}`)
            .then(res => {
                const video = JSON.parse(res.request.response).video;
                this.video = Object.values(video)[0];
            })
        }
    }
}
</script>

<style scoped>

</style>