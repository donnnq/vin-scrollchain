// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToWhiteHouseNoPayProtocol {
    string public batchID = "1321.9.90";
    string public steward = "Vinvin";

    struct Official {
        string role;
        bool forfeitsPay;
    }

    mapping(string => Official) public noPayRegistry;

    constructor() {
        noPayRegistry["President"] = Official("President", true);
        noPayRegistry["Vice President"] = Official("Vice President", true);
        noPayRegistry["Senator"] = Official("Senator", true);
        noPayRegistry["Representative"] = Official("Representative", true);
        noPayRegistry["Cabinet"] = Official("Cabinet", true);
    }

    function isForfeitingPay(string memory role) public view returns (bool) {
        return noPayRegistry[role].forfeitsPay;
    }
}
