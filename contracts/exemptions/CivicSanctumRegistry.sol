// SPDX-License-Identifier: Civic-Mythic
pragma solidity ^0.8.21;

contract CivicSanctumRegistry {
    struct StewardProfile {
        string name;
        address stewardAddress;
        uint256 totalResonance;
        bool isExempt;
        bool dynastyNeutral;
    }

    mapping(address => StewardProfile) public registry;
    address public registrar;

    event StewardRegistered(address steward, string name);
    event ExemptionUpdated(address steward, bool status);
    event DynastyStatusUpdated(address steward, bool neutral);

    modifier onlyRegistrar() {
        require(msg.sender == registrar, "Unauthorized sanctum access.");
        _;
    }

    constructor() {
        registrar = msg.sender;
    }

    function registerSteward(
        address _steward,
        string memory _name,
        uint256 _resonance,
        bool _exempt,
        bool _neutral
    ) public onlyRegistrar {
        registry[_steward] = StewardProfile(_name, _steward, _resonance, _exempt, _neutral);
        emit StewardRegistered(_steward, _name);
    }

    function updateExemption(address _steward, bool _status) public onlyRegistrar {
        registry[_steward].isExempt = _status;
        emit ExemptionUpdated(_steward, _status);
    }

    function updateDynastyStatus(address _steward, bool _neutral) public onlyRegistrar {
        registry[_steward].dynastyNeutral = _neutral;
        emit DynastyStatusUpdated(_steward, _neutral);
    }

    function viewSteward(address _steward) public view returns (StewardProfile memory) {
        return registry[_steward];
    }
}
