// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToInteroperabilityProtocol {
    string public batchID = "1321.9.118";
    string public steward = "Vinvin";

    address public admin;

    struct Interop {
        string railA;
        string railB;
        string method; // bridge, swap, API
        uint256 timestamp;
    }

    Interop[] public interops;

    event InteropCodified(string railA, string railB, string method);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function codifyInterop(string memory railA, string memory railB, string memory method) public onlyAdmin {
        interops.push(Interop(railA, railB, method, block.timestamp));
        emit InteropCodified(railA, railB, method);
    }

    function getInterop(uint256 index) public view returns (string memory railA, string memory railB, string memory method, uint256 timestamp) {
        Interop memory i = interops[index];
        return (i.railA, i.railB, i.method, i.timestamp);
    }
}
