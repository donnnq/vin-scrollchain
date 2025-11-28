// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToDefenseLedger {
    string public batchID = "1321.9.161";
    string public steward = "Vinvin";

    address public admin;

    struct DefenseAction {
        string measure;     // credential rotation, patch, audit
        string package;
        uint256 timestamp;
    }

    DefenseAction[] public actions;

    event DefenseLogged(string measure, string package);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logDefense(string memory measure, string memory package) public onlyAdmin {
        actions.push(DefenseAction(measure, package, block.timestamp));
        emit DefenseLogged(measure, package);
    }

    function getDefense(uint256 index) public view returns (string memory measure, string memory package, uint256 timestamp) {
        DefenseAction memory d = actions[index];
        return (d.measure, d.package, d.timestamp);
    }
}
