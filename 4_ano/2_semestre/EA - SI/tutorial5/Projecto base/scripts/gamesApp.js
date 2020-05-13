class Game {
    // Private fields
    #id; #name; #year; #platform; #price; #description;
    //Constructor
    constructor(id, name, year, platform, price, description) {
        this.#id = id;
        this.#name = name;
        this.#year = year;
        this.#platform = platform;
        this.#price = price;
        this.#description = description;
    }
    //Getters
    get id() { return this.#id; }
    get name() { return this.#name; }
    get year() { return this.#year; }
    get platform() { return this.#platform; }
    get price() { return this.#price; }
    get description() { return this.#description; }
}

var vm = new Vue({
    el: "#gamesApp",
    data: {
        appName: "Games App",
        userName: "Francisco",
        games: [/*new Game(1, "Tetris", 1989, "Megadrive"),
                new Game(2, "GTA V", 2013, "PC"),
                new Game(3, "Assetto Corsa", 2014, "Android"),
                new Game(4, "Fallout 4", 2014, "Megadrive"),
                new Game(5, "Breath of The Wild", 2017, "Megadrive"),
                new Game(6, "FIFA", 1989, "Megadrive"),
                new Game(7, "PES", 1989, "Megadrive"),
                new Game(8, "CS", 1989, "Megadrive"),
                new Game(9, "Minecraft", 2009, "Android"),
                new Game(10, "Fortnite ", 2017, "PC"),
                new Game(11, "Pack-Man", 1980, "Megadrive")*/
            ],
        selYear: 'year',
        selPlatform: 'platform',
        load: '',
        page: 0,
        selGame: {}
    },
    computed: {
        gamesFiltered: function () {
            console.log(this.selYear, this.selPlatform);
            this.page = 0;
            if(this.selYear != 'year' && this.selPlatform != 'platform') {
                return this.games.filter((game) => 
                game.year === this.selYear && game.platform === this.selPlatform)
            }
            if (this.selYear != 'year') {
                return this.games.filter((game) => game.year === this.selYear)
            }
            if (this.selPlatform != 'platform') {
                return this.games.filter((game) => game.platform === this.selPlatform)
            }
            return this.games;
        },
        gamesPaginated: function () {
            var list = [];
            var len = this.gamesFiltered.length;
            var pages = Math.ceil(len/4);
            var items = 4;
            var i;
            for (i = 1; i < pages + 1; i++) { 
                var sublist = [];
                var indexi = items * i - items;
                var indexs = items * i;
                if (indexs > len)
                    indexs = len;
                sublist = this.gamesFiltered.slice(indexi, indexs);
                list.push(sublist);
            }
            console.log(list);
            return list;
        }
    },
    methods: {
        async function () {
            var gamesURL = "http://ivy.di.uminho.pt:8080/GamesLibraryProvider/GamesService?action=list"
            try {
                const response = await fetch(gamesURL);
                this.games = await response.json();
                this.load = "Load data with success!"
            } catch (error) {
                this.load = "Error " + error + "while load data!"
            }
        }  
    },
    created() {
        this.function();
    }
})

Vue.component('game-show', {
    props: ['game'],
    template: `
    <div>
        <h3>{{game.name}}</h3>
        <p>
            Id: {{game.id}}<br />
            Year: {{game.year}}<br />
            Price: {{game.price}}<br />
            Description: {{game.description}}<br />
            Platform: {{game.platform}}
        </p>
        <button v-on:click="$emit('back')">Back</button>
    </div>
    `
})

Vue.component('games-filter', {
    props:  ['listOfGames', 'selYear', 'selPlatform'],
    data: function () {
        return {
            year: this.selYear, // local copy of prop
            platform: this.selPlatform
        }
    },
    computed: {
        years: function () {
            var list = [];
            this.listOfGames.forEach(function (g) {
                if (!(list.includes(g.year))) {
                    list.push(g.year);
                }
            });
            return list;
        },
        platforms: function () {
            var list = [];
            this.listOfGames.forEach(function (g) {
                if (!(list.includes(g.platform))) {
                    list.push(g.platform);
                }
            });
            return list;
        },
    },
    template: `
        <form>
            <fieldset>
                <legend>Filter</legend>
                <select class="form-control" v-model.number="year" v-on:change="$emit('newyear', year)">
                    <option>year</option>
                    <option v-for="y in years">{{y}}</option>
                </select>
                <select class="form-control" v-model="platform" v-on:change="$emit('newplatform', platform)">
                    <option>platform</option>
                    <option v-for="p in platforms">{{p}}</option>
                </select>
            </fieldset>
        </form>
        `
})

Vue.component('games-filter', {
    props:  ['listOfGames', 'selYear', 'selPlatform'],
    data: function () {
        return {
            year: this.selYear,
            platform: this.selPlatform
        }
    },
    computed: {
        years: function () {
            var list = [];
            this.listOfGames.forEach(function (g) {
                if (!(list.includes(g.year))) {
                    list.push(g.year);
                }
            });
            return list;
        },
        platforms: function () {
            var list = [];
            this.listOfGames.forEach(function (g) {
                if (!(list.includes(g.platform))) {
                    list.push(g.platform);
                }
            });
            return list;
        },
    },
    template: `
        <form>
            <fieldset>
                <legend>Filter</legend>
                <select class="form-control" v-model.number="year" v-on:change="$emit('newyear', year)">
                    <option>year</option>
                    <option v-for="y in years">{{y}}</option>
                </select>
                <select class="form-control" v-model="platform" v-on:change="$emit('newplatform', platform)">
                    <option>platform</option>
                    <option v-for="p in platforms">{{p}}</option>
                </select>
            </fieldset>
        </form>
        `
})

Vue.component('games-list', {
    props:  ['listGamesPaginated', 'listGamesFiltered', 'actualPage', 'numPages', 'selGame'],
    template: `
        <div class="col-sm-8">
            <table class="table table-striped table-bordered table-sm">
                <thead>
                    <tr><th>Games</th><th class="extras">Year</th><th>Platform</th></tr>
                </thead>
                <tbody>
                    <tr v-for="g in listGamesPaginated[actualPage]"
                    v-bind:key="g.id"
                    v-on:click="selGame == g ? $emit('newselgame', {}) : $emit('newselgame', g)">
                        <td>{{g.name}}</td><td>{{g.year}}</td><td>{{g.platform}}</td>
                    </tr>
                </tbody>
            </table>
            <nav class="d-flex justify-content-end" v-if="listGamesFiltered.length>4">
                <form class="pagination">
                    <button type="button" 
                        v-on:click="$emit('newpage', actualPage-1)" 
                        v-on:click.ctrl="$emit('newpage', 0)"
                        v-bind:disabled="actualPage==0">&Lt;
                    </button>
                    <button v-for="idx in numPages" type="button" v-on:click="$emit('newpage', idx-1)">
                        {{idx}}
                    </button>
                    <button type="button" 
                        v-on:click="$emit('newpage', actualPage+1)" 
                        v-on:click.ctrl="$emit('newpage', numPages-1)" 
                        v-bind:disabled="actualPage==numPages-1" >
                        &Gt;
                    </button>
                </form>
            </nav>
        </div>
        `
})
