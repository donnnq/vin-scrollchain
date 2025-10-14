// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaNourishmentDAO {
    address public admin;

    struct NourishmentGrant {
        string community;
        string region;
        string foodTradition;
        uint256 grantAmount;
        bool disbursed;
    }

    NourishmentGrant[] public grants;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function proposeGrant(string memory _community, string memory _region, string memory _foodTradition, uint256 _amount) external onlyAdmin {
        grants.push(NourishmentGrant(_community, _region, _foodTradition, _amount, false));
    }

    function disburseGrant(uint256 index) external onlyAdmin {
        grants[index].disbursed = true;
    }

    function getGrant(uint256 index) external view returns (NourishmentGrant memory) {
        return grants[index];
    }
}
