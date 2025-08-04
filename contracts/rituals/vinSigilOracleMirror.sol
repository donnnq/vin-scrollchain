// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSigilOracleMirror {
    address public chroniclerNode;
    mapping(bytes32 => string) public auraForecasts;
    mapping(string => uint256) public elementalImpactIndex;

    event AuraForecasted(bytes32 ritualID, string auraLabel, uint256 impactScore);

    modifier onlyChronicler() {
        require(msg.sender == chroniclerNode, "Only chronicler can forecast aura");
        _;
    }

    constructor(address _chroniclerNode) {
        chroniclerNode = _chroniclerNode;
    }

    function reflectSigil(bytes32 ritualID, string memory elementType, string memory originEpoch) public onlyChronicler {
        string memory aura = mirrorAura(elementType, originEpoch);
        uint256 impactScore = calculateImpact(elementType);
        auraForecasts[ritualID] = aura;
        elementalImpactIndex[elementType] += impactScore;

        emit AuraForecasted(ritualID, aura, impactScore);
    }

    function mirrorAura(string memory elementType, string memory originEpoch) internal pure returns (string memory) {
        if (keccak256(bytes(elementType)) == keccak256("WaterSigil")) return string(abi.encodePacked("Hydration Surge — ", originEpoch));
        if (keccak256(bytes(elementType)) == keccak256("AirSigil")) return string(abi.encodePacked("Clarity Drift — ", originEpoch));
        if (keccak256(bytes(elementType)) == keccak256("EarthSigil")) return string(abi.encodePacked("Root Network Expansion — ", originEpoch));
        return string(abi.encodePacked("Void Reverberation — ", originEpoch));
    }

    function calculateImpact(string memory elementType) internal pure returns (uint256) {
        if (keccak256(bytes(elementType)) == keccak256("WaterSigil")) return 40;
        if (keccak256(bytes(elementType)) == keccak256("AirSigil")) return 25;
        if (keccak256(bytes(elementType)) == keccak256("EarthSigil")) return 35;
        return 15;
    }

    function fetchAura(bytes32 ritualID) public view returns (string memory) {
        return auraForecasts[ritualID];
    }

    function getElementalIndex(string memory elementType) public view returns (uint256) {
        return elementalImpactIndex[elementType];
    }

    function updateChronicler(address newChronicler) public onlyChronicler {
        chroniclerNode = newChronicler;
    }
}
