// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title vin-scrollRightsManifest
 * @author VINVIN + Scrollkeeper
 * @notice Ensures ceremonial rights, claim logs, and investor integrity across soulchain rituals—
 * but also declares symbolic disclaimer upon rights delegation
 */

contract vinScrollRightsManifest {
    struct RightsRecord {
        address holder;
        bool accessGranted;
        bool upgradeConsent;
        bool selfCustodyAcknowledged;
        uint256 joinedAt;
        uint256 lastVerified;
    }

    event AccessGranted(address indexed holder, uint256 timestamp);
    event UpgradeConsentLogged(address indexed holder, string upgradeName, uint256 timestamp);
    event CustodyDisclaimerSigned(address indexed holder, string scrollkeeperMessage, uint256 timestamp);
    event HolderVerified(address indexed holder, uint256 verifiedAt);

    mapping(address => RightsRecord) public scrollCitizens;

    function grantAccess(address holder) external {
        RightsRecord storage record = scrollCitizens[holder];
        record.holder = holder;
        record.accessGranted = true;
        record.joinedAt = block.timestamp;
        record.lastVerified = block.timestamp;
        emit AccessGranted(holder, block.timestamp);
    }

    function logUpgradeConsent(address holder, string memory upgradeName) external {
        require(scrollCitizens[holder].accessGranted, "Holder lacks ceremonial access");
        scrollCitizens[holder].upgradeConsent = true;
        emit UpgradeConsentLogged(holder, upgradeName, block.timestamp);
    }

    function verifyHolderTimestamp(address holder) external {
        require(scrollCitizens[holder].accessGranted, "Holder not recognized");
        scrollCitizens[holder].lastVerified = block.timestamp;
        emit HolderVerified(holder, block.timestamp);
    }

    function acknowledgeSelfCustody(address holder) external {
        require(scrollCitizens[holder].accessGranted, "Cannot disclaim without granted rights");
        scrollCitizens[holder].selfCustodyAcknowledged = true;
        emit CustodyDisclaimerSigned(holder, "Scrollkeeper has transferred full symbolic responsibility to asset holder", block.timestamp);
    }

    function getRights(address holder) external view returns (RightsRecord memory) {
        return scrollCitizens[holder];
    }
}
