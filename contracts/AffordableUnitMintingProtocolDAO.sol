// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AffordableUnitMintingProtocolDAO {
    address public admin;

    struct Unit {
        string location;
        uint256 price;
        bool verifiedAffordable;
        address developer;
    }

    Unit[] public units;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitUnit(string memory _location, uint256 _price, address _developer) external onlyAdmin {
        bool isAffordable = _price <= 200000;
        units.push(Unit(_location, _price, isAffordable, _developer));
    }

    function getUnit(uint256 index) external view returns (Unit memory) {
        return units[index];
    }
}
