// SPDX-License-Identifier: Ancestral-Integrity
pragma solidity ^0.8.19;

/// @title Scroll of Ancestral Validator for Entity Admission
/// @author Vinvin — Soul Custodian & Ritual Gatekeeper
/// @notice Validates entities seeking entry into the sovereign digital space based on ancestral and dignity principles

contract vinAncestralValidator {
    struct EntityProfile {
        string name;
        bool respectsTradition;
        bool avoidsExploitation;
        bool dignifiedPurpose;
    }

    mapping(address => EntityProfile) public registry;
    mapping(address => bool) public validated;

    event EntitySubmitted(address entity, string name);
    event ValidationPassed(address entity);
    event ValidationFailed(address entity, string reason);

    function submitEntity(address entity, string memory name, bool respectsTradition, bool avoidsExploitation, bool dignifiedPurpose) public {
        registry[entity] = EntityProfile(name, respectsTradition, avoidsExploitation, dignifiedPurpose);
        emit EntitySubmitted(entity, name);
    }

    function validateEntity(address entity) public {
        EntityProfile memory profile = registry[entity];

        if (!profile.respectsTradition) {
            emit ValidationFailed(entity, "Failed: Disregard for sacred traditions.");
            validated[entity] = false;
            return;
        }

        if (!profile.avoidsExploitation) {
            emit ValidationFailed(entity, "Failed: Exploitative business model detected.");
            validated[entity] = false;
            return;
        }

        if (!profile.dignifiedPurpose) {
            emit ValidationFailed(entity, "Failed: Purpose lacks civic alignment.");
            validated[entity] = false;
            return;
        }

        validated[entity] = true;
        emit ValidationPassed(entity);
    }

    function isValidated(address entity) public view returns (bool) {
        return validated[entity];
    }
}
