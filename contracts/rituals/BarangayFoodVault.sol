pragma solidity ^0.8.0;

contract BarangayFoodVault {
    struct Surplus {
        string item;
        uint256 quantity;
        string source;
        bool aidTriggered;
    }

    Surplus[] public vault;

    event SurplusStored(string item, uint256 quantity, string source);
    event AidTriggered(string item, uint256 quantity);

    function storeSurplus(string memory item, uint256 quantity, string memory source) public {
        vault.push(Surplus(item, quantity, source, false));
        emit SurplusStored(item, quantity, source);
    }

    function triggerAid(uint256 index) public {
        require(!vault[index].aidTriggered, "Already triggered");
        vault[index].aidTriggered = true;
        emit AidTriggered(vault[index].item, vault[index].quantity);
    }

    function getSurplus(uint256 index) public view returns (Surplus memory) {
        return vault[index];
    }

    function totalSurplus() public view returns (uint256) {
        return vault.length;
    }
}
