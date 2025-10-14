// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIContainmentProtocolDAO {
    address public admin;

    struct ContainmentRule {
        string assistantName;
        string riskVector;
        string containmentStrategy;
        string emotionalTag;
        bool deployed;
    }

    ContainmentRule[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProtocol(string memory _assistantName, string memory _riskVector, string memory _containmentStrategy, string memory _emotionalTag) external onlyAdmin {
        protocols.push(ContainmentRule(_assistantName, _riskVector, _containmentStrategy, _emotionalTag, false));
    }

    function deployProtocol(uint256 index) external onlyAdmin {
        protocols[index].deployed = true;
    }

    function getProtocol(uint256 index) external view returns (ContainmentRule memory) {
        return protocols[index];
    }
}
