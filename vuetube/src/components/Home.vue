<template>
    <div class="landing">
        <Navbar />
        <h1 class="landing-recommended">Recommended</h1>

        <div class="landing-content">
            <div v-on:click="nav(video.id)" class="landing-video" v-bind:key="video.id" v-for="video in videos">
                <h2>{{video.title}}</h2>
            </div>
        </div>
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
            videos: []
        }
    }, 
    created() {
        this.fetchData()
    },
    methods: {
        fetchData() {
            plainAxiosInstance.get('/api/videos')
            .then(res => {
                const videos = JSON.parse(res.request.response).video;
                this.videos = Object.values(videos);
            })
        },
        nav: function(id) {
            this.$router.push(`/video/${id}`)
        }
    }
}
</script>

<style scoped>
.landing {
    margin: 0 auto;
    width: 70%;
}

.landing-recommended {
    font-size: 1.5em;
    font-weight: bolder;
}

.landing-content {
    display: flex;
}

.landing-video {
    width: 350px;
    height: 175px;
    background-color: lightgray;
    border: 1px solid gray;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 20px;
}

.landing-video:hover {
    cursor: pointer;
    background-color: white;
}

</style>