// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToWhistleblowerProtectionProtocol {
    string public batchID = "1321.9.107";
    string public steward = "Vinvin";

    address public admin;

    struct Whistleblower {
        address identity;
        string caseTag;
        bool protected;
        uint256 timestamp;
    }

    mapping(address => Whistleblower) public whistleblowers;

    event WhistleblowerProtected(address indexed identity, string caseTag);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function protectWhistleblower(address identity, string memory caseTag) public onlyAdmin {
        whistleblowers[identity] = Whistleblower(identity, caseTag, true, block.timestamp);
        emit WhistleblowerProtected(identity, caseTag);
    }

    function getWhistleblower(address identity) public view returns (string memory caseTag, bool protected, uint256 timestamp) {
        Whistleblower memory w = whistleblowers[identity];
        return (w.caseTag, w.protected, w.timestamp);
    }
}
