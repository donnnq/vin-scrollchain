// SPDX-License-Identifier: Ad-Dignity-Sovereignty
pragma solidity ^0.8.19;

/// @title Registry of Civic-Compliant Advertisers
/// @author Vinvin — Scrollsmith of Sovereign Filtering
/// @notice Only advertisers that pass ancestral and dignity protocols may promote content

contract vinAdvertiserRegistry {
    struct Advertiser {
        string name;
        bool promotesDignity;
        bool avoidsExploitation;
        bool notGamblingRelated;
    }

    mapping(address => Advertiser) public registry;
    mapping(address => bool) public approved;

    event AdvertiserSubmitted(address addr, string name);
    event ApprovalGranted(address addr);
    event ApprovalDenied(address addr, string reason);

    function submitAdvertiser(address addr, string memory name, bool dignity, bool ethical, bool notGamble) public {
        registry[addr] = Advertiser(name, dignity, ethical, notGamble);
        emit AdvertiserSubmitted(addr, name);

        if (dignity && ethical && notGamble) {
            approved[addr] = true;
            emit ApprovalGranted(addr);
        } else {
            approved[addr] = false;
            emit ApprovalDenied(addr, "Failed dignity filter or gamble-related content.");
        }
    }

    function isApproved(address addr) public view returns (bool) {
        return approved[addr];
    }
}
