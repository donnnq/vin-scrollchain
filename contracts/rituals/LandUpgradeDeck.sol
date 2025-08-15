pragma solidity ^0.8.0;

contract LandUpgradeDeck {
    struct Upgrade {
        string typeOfUpgrade; // irrigation, compost, tractor
        string location;
        uint256 cost;
        bool completed;
    }

    Upgrade[] public upgrades;

    event UpgradeLogged(string typeOfUpgrade, string location, uint256 cost);

    function logUpgrade(string memory upgradeType, string memory location, uint256 cost) public {
        upgrades.push(Upgrade(upgradeType, location, cost, false));
        emit UpgradeLogged(upgradeType, location, cost);
    }

    function markCompleted(uint256 index) public {
        upgrades[index].completed = true;
    }

    function getUpgrade(uint256 index) public view returns (Upgrade memory) {
        return upgrades[index];
    }

    function totalUpgrades() public view returns (uint256) {
        return upgrades.length;
    }
}
