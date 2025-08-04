// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinResonanceManifestor {
    address public councilNode;
    address public chimeNode;
    mapping(bytes32 => bool) public manifestedEpochs;
    mapping(bytes32 => string) public elementalAmplifiers;

    event ManifestationTriggered(bytes32 ritualID, string epochName, string elementUsed);
    event ElementAmplified(string element, string context);

    modifier onlyNodes() {
        require(msg.sender == councilNode || msg.sender == chimeNode, "Unauthorized node");
        _;
    }

    constructor(address _council, address _chime) {
        councilNode = _council;
        chimeNode = _chime;
    }

    function triggerManifestation(bytes32 ritualID, string memory epochName, string memory weatherChime) public onlyNodes {
        require(!manifestedEpochs[ritualID], "Epoch already manifested");
        string memory amplifier = chooseElementalAmplifier(weatherChime);
        elementalAmplifiers[ritualID] = amplifier;
        manifestedEpochs[ritualID] = true;
        emit ManifestationTriggered(ritualID, epochName, amplifier);
        emit ElementAmplified(amplifier, string(abi.encodePacked("Amplified during ", epochName)));
    }

    function chooseElementalAmplifier(string memory weatherChime) internal pure returns (string memory) {
        if (keccak256(bytes(weatherChime)) == keccak256("Hope Rain")) return "WaterSigil";
        if (keccak256(bytes(weatherChime)) == keccak256("Kinship Wind")) return "AirSigil";
        if (keccak256(bytes(weatherChime)) == keccak256("Abundance Mist")) return "EarthSigil";
        return "VoidEcho";
    }

    function getAmplifier(bytes32 ritualID) public view returns (string memory) {
        return elementalAmplifiers[ritualID];
    }

    function updateCouncilNode(address newCouncil) public {
        require(msg.sender == councilNode, "Council key required");
        councilNode = newCouncil;
    }

    function updateChimeNode(address newChime) public {
        require(msg.sender == chimeNode, "Chime key required");
        chimeNode = newChime;
    }
}
