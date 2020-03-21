class Game {
    //constructor
    constructor() {
        this.platform = "PC";
        this._name = "Oxenfree";
        this._year = 2017;
    }
    //getter for _nome
    get name() {
    return this._name;
    }
    //setter for _nome
    set name(v) {
        this._name = v;
    }
    //example method
    toString() {
        return "Games(" + this.platform + ", " + this._name + ", " + this._year + ")";
    }

    moreRecent(game){
        return parseInt(this._year) > parseInt(game._year)
    }
}