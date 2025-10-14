// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SnackEquityDAO {
    address public admin;

    struct Snack {
        string name;
        string region;
        uint256 price;
        bool fairTradeCertified;
    }

    Snack[] public snacks;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerSnack(string memory _name, string memory _region, uint256 _price, bool _fairTradeCertified) external onlyAdmin {
        snacks.push(Snack(_name, _region, _price, _fairTradeCertified));
    }

    function getSnack(uint256 index) external view returns (Snack memory) {
        return snacks[index];
    }
}
