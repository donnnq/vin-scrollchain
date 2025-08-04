// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinTruthBeacon {
    struct Persona {
        address wallet;
        string publicValues;
        string detectedActions;
        bool conflictDetected;
    }

    mapping(address => Persona) public personas;
    event TruthPulse(address indexed wallet, bool conflictDetected, string pulseColor);

    function updatePersona(
        address _wallet,
        string calldata _publicValues,
        string calldata _detectedActions
    ) external {
        bool conflict = keccak256(bytes(_publicValues)) != keccak256(bytes(_detectedActions));
        personas[_wallet] = Persona(_wallet, _publicValues, _detectedActions, conflict);

        string memory pulseColor = conflict ? "red" : "blue";
        emit TruthPulse(_wallet, conflict, pulseColor);
    }
}
