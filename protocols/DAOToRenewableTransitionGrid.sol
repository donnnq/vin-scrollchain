// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToRenewableTransitionGrid {
    string public batchID = "1321.9.194";
    string public steward = "Vinvin";

    address public admin;

    struct Transition {
        string source;      // solar, wind, hydro, geothermal
        string status;      // initiated, completed, audited
        uint256 timestamp;
    }

    Transition[] public transitions;

    event TransitionLogged(string source, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTransition(string memory source, string memory status) public onlyAdmin {
        transitions.push(Transition(source, status, block.timestamp));
        emit TransitionLogged(source, status);
    }

    function getTransition(uint256 index) public view returns (string memory source, string memory status, uint256 timestamp) {
        Transition memory t = transitions[index];
        return (t.source, t.status, t.timestamp);
    }
}
