// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToEssentialWorkerImmunityGrid {
    string public batchID = "1321.9.90";
    string public steward = "Vinvin";

    struct Worker {
        string sector;
        bool protected;
    }

    mapping(string => Worker) public immunityRegistry;

    constructor() {
        immunityRegistry["Healthcare"] = Worker("Healthcare", true);
        immunityRegistry["Transport"] = Worker("Transport", true);
        immunityRegistry["Sanitation"] = Worker("Sanitation", true);
        immunityRegistry["Military"] = Worker("Military", true);
        immunityRegistry["Emergency"] = Worker("Emergency", true);
    }

    function isProtected(string memory sector) public view returns (bool) {
        return immunityRegistry[sector].protected;
    }
}
