// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title PipelinePact - Encodes interprovincial energy deals and federal bypass logic
/// @author Vinvin
/// @notice Allows provinces to propose, ratify, and execute energy infrastructure agreements

contract PipelinePact {
    address public scrollsmith;

    struct Pact {
        string province;
        string foreignPartner;
        string resourceType;
        string terms;
        bool ratified;
        uint256 timestamp;
    }

    Pact[] public pacts;
    mapping(uint256 => mapping(address => bool)) public ratifiers;

    event PactProposed(string province, string foreignPartner, string resourceType);
    event PactRatified(uint256 pactId, address ratifier);
    event PactExecuted(uint256 pactId);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function proposePact(string calldata province, string calldata foreignPartner, string calldata resourceType, string calldata terms) external onlyScrollsmith {
        pacts.push(Pact(province, foreignPartner, resourceType, terms, false, block.timestamp));
        emit PactProposed(province, foreignPartner, resourceType);
    }

    function ratifyPact(uint256 pactId) external {
        require(pactId < pacts.length, "Invalid pact ID");
        require(!ratifiers[pactId][msg.sender], "Already ratified");

        ratifiers[pactId][msg.sender] = true;
        emit PactRatified(pactId, msg.sender);
    }

    function executePact(uint256 pactId) external onlyScrollsmith {
        require(pactId < pacts.length, "Invalid pact ID");
        Pact storage p = pacts[pactId];
        require(!p.ratified, "Already executed");

        p.ratified = true;
        emit PactExecuted(pactId);
    }

    function getAllPacts() external view returns (Pact[] memory) {
        return pacts;
    }
}
