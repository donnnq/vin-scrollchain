contract vinNutrientRotation {
    string public mission = "Transform excess into aid. Let surplus rotate where scarcity lives.";
    string public pricing = "Half-price for verified struggling nations — value with dignity.";
    address public initiator;

    struct FoodSurplus {
        string product;
        string originCountry;
        uint256 expiryDate;
        bool isAllocated;
    }

    FoodSurplus[] public surplusLog;

    constructor(address _vinvin) {
        initiator = _vinvin;
    }

    function recordSurplus(string memory product, string memory originCountry, uint256 expiryDate) public {
        surplusLog.push(FoodSurplus(product, originCountry, expiryDate, false));
    }

    function allocateToNation(uint index, string memory destinationCountry) public returns (string memory) {
        require(index < surplusLog.length, "Invalid index");
        surplusLog[index].isAllocated = true;
        return string(abi.encodePacked("Scrollkeeper aid rotation: ", surplusLog[index].product, " from ", surplusLog[index].originCountry, " sent to ", destinationCountry, " at 50% value."));
    }

    function countSurplus() public view returns (uint) {
        return surplusLog.length;
    }
}
