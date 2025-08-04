// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinElementalSigilCaster {
    address public manifestorNode;
    mapping(bytes32 => string) public castSigils;
    mapping(string => uint256) public elementCooldown;
    uint256 public globalSigilLimit = 100;
    uint256 public sigilCount;

    event SigilCast(bytes32 ritualID, string elementType, uint256 timestamp);
    event SigilDenied(string reason);

    modifier onlyManifestor() {
        require(msg.sender == manifestorNode, "Not authorized");
        _;
    }

    constructor(address _manifestorNode) {
        manifestorNode = _manifestorNode;
    }

    function castElementalSigil(bytes32 ritualID, string memory elementType) public onlyManifestor {
        require(sigilCount < globalSigilLimit, "Global sigil capacity reached");
        require(block.timestamp > elementCooldown[elementType], "Element on cooldown");

        castSigils[ritualID] = elementType;
        sigilCount += 1;
        elementCooldown[elementType] = block.timestamp + 1 days;

        emit SigilCast(ritualID, elementType, block.timestamp);
    }

    function getCastSigil(bytes32 ritualID) public view returns (string memory) {
        return castSigils[ritualID];
    }

    function updateManifestor(address newNode) public {
        require(msg.sender == manifestorNode, "Only manifestor can update");
        manifestorNode = newNode;
    }

    function adjustGlobalSigilLimit(uint256 newLimit) public onlyManifestor {
        globalSigilLimit = newLimit;
    }
}
