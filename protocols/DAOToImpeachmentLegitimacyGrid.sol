// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToImpeachmentLegitimacyGrid {
    string public batchID = "1321.9.179";
    string public steward = "Vinvin";

    address public admin;

    struct ImpeachmentMove {
        string initiator;    // House, Senate, political bloc
        string basis;        // constitutional ground
        uint256 timestamp;
    }

    ImpeachmentMove[] public moves;

    event MoveLogged(string initiator, string basis);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logMove(string memory initiator, string memory basis) public onlyAdmin {
        moves.push(ImpeachmentMove(initiator, basis, block.timestamp));
        emit MoveLogged(initiator, basis);
    }

    function getMove(uint256 index) public view returns (string memory initiator, string memory basis, uint256 timestamp) {
        ImpeachmentMove memory m = moves[index];
        return (m.initiator, m.basis, m.timestamp);
    }
}
