pragma solidity ^0.8.0;

contract AgriPamanaVault {
    struct Legacy {
        string farmerName;
        string contribution;
        string location;
        uint256 timestamp;
    }

    Legacy[] public legacies;

    event LegacyImmortalized(string farmerName, string contribution, string location);

    function immortalize(string memory name, string memory contribution, string memory location) public {
        legacies.push(Legacy(name, contribution, location, block.timestamp));
        emit LegacyImmortalized(name, contribution, location);
    }

    function getLegacy(uint256 index) public view returns (Legacy memory) {
        return legacies[index];
    }

    function totalLegacies() public view returns (uint256) {
        return legacies.length;
    }
}
