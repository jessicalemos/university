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
        page: 0
    },
    computed: {
        years: function () {
            var list = [];
            this.games.forEach(function (g) {
                if (!(list.includes(g.year))) {
                    list.push(g.year);
                }
            });
            return list;
        },
        platforms: function () {
            var list = [];
            this.games.forEach(function (g) {
                if (!(list.includes(g.platform))) {
                    list.push(g.platform);
                }
            });
            return list;
        },
        gamesFiltered: function () {
            this.page = 0;
            if(this.selYear != 'year' && this.selPlatform != 'platform') {
                return this.games.filter((game) => 
                game.year === this.selYear && game.platform === this.selPlatform)
            }
            if (this.selPlatform != 'platform') {
                return this.games.filter((game) => game.platform === this.selPlatform)
            }
            if (this.selYear != 'year') {
                return this.games.filter((game) => game.year === this.selYear)
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
                console.log(sublist);
            }
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

