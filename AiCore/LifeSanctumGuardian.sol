// SPDX-License-Identifier: Life-Protection
pragma solidity ^0.8.19;

/// @title LifeSanctumGuardian
/// @notice Ritualizes protection and restoration of all life forms—flora, fauna, and rare ecosystems

contract LifeSanctumGuardian {
    address public steward;

    struct LifeForm {
        string name;
        string category; // "Flora", "Fauna", "Human", "Rare"
        bool endangered;
        string restorationProtocol;
    }

    mapping(string => LifeForm) public protectedLife;
    string[] public lifeKeys;

    event LifeFormProtected(string name, string category, bool endangered);
    event RestorationActivated(string name, string protocol);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function protectLifeForm(
        string memory key,
        string memory name,
        string memory category,
        bool endangered,
        string memory restorationProtocol
    ) external onlySteward {
        protectedLife[key] = LifeForm(name, category, endangered, restorationProtocol);
        lifeKeys.push(key);
        emit LifeFormProtected(name, category, endangered);
    }

    function activateRestoration(string memory key) external onlySteward {
        emit RestorationActivated(protectedLife[key].name, protectedLife[key].restorationProtocol);
    }

    function getLifeForm(string memory key) external view returns (LifeForm memory) {
        return protectedLife[key];
    }
}
