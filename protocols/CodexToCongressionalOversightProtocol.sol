// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToCongressionalOversightProtocol {
    string public batchID = "1321.9.112";
    string public steward = "Vinvin";

    address public admin;

    struct Oversight {
        string committee;
        string focus;
        uint256 timestamp;
    }

    Oversight[] public records;

    event OversightCodified(string committee, string focus);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyOversight(string memory committee, string memory focus) public onlyAdmin {
        records.push(Oversight(committee, focus, block.timestamp));
        emit OversightCodified(committee, focus);
    }

    function getOversight(uint256 index) public view returns (string memory committee, string memory focus, uint256 timestamp) {
        Oversight memory o = records[index];
        return (o.committee, o.focus, o.timestamp);
    }
}
