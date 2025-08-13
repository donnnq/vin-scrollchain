// SPDX-License-Identifier: Mythic-Scrollsmith
pragma solidity ^0.8.0;

/// @title vinCannabisLegalizationProtocol
/// @author Vinvin
/// @notice Legalizes cannabis for medical and recreational use with scrollchain safeguards
/// @dev This contract encodes civic healing, emotional APR, and age-based access

contract vinCannabisLegalizationProtocol {
    address public steward;
    uint256 public recreationalAge = 25;

    enum UseType { Medical, Recreational }
    enum Status { Illegal, Legal }

    struct Citizen {
        uint256 age;
        bool hasMedicalCondition;
        bool isApproved;
    }

    mapping(address => Citizen) public citizens;
    mapping(UseType => Status) public cannabisStatus;

    event ScrollUpdated(address indexed citizen, UseType useType, string verdict);

    modifier onlySteward() {
        require(msg.sender == steward, "Not scrollsmith-authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
        cannabisStatus[UseType.Medical] = Status.Legal;
        cannabisStatus[UseType.Recreational] = Status.Legal;
    }

    function registerCitizen(address _citizen, uint256 _age, bool _hasMedicalCondition) external onlySteward {
        citizens[_citizen] = Citizen(_age, _hasMedicalCondition, false);
    }

    function approveUsage(address _citizen, UseType _useType) external onlySteward {
        Citizen storage c = citizens[_citizen];

        if (_useType == UseType.Medical && c.hasMedicalCondition) {
            c.isApproved = true;
            emit ScrollUpdated(_citizen, _useType, "Medical use approved");
        } else if (_useType == UseType.Recreational && c.age >= recreationalAge) {
            c.isApproved = true;
            emit ScrollUpdated(_citizen, _useType, "Recreational use approved");
        } else {
            emit ScrollUpdated(_citizen, _useType, "Usage denied: Scrollchain mismatch");
        }
    }

    function getStatus(UseType _useType) external view returns (Status) {
        return cannabisStatus[_useType];
    }

    function isApproved(address _citizen) external view returns (bool) {
        return citizens[_citizen].isApproved;
    }
}
