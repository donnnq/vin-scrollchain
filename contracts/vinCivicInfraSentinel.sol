// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/// @title vinCivicInfraSentinel.sol
/// @notice Centralized contract that links audit, alert, and update protocols for full civic infrastructure transparency.

contract vinCivicInfraSentinel {
    address public sentinel;
    uint256 public totalSites;

    struct Site {
        string name;
        address contractor;
        bool isActive;
        uint256 lastUpdate;
    }

    mapping(uint256 => Site) public sites;
    mapping(address => bool) public flaggedContractors;

    event SiteRegistered(uint256 indexed siteId, string name);
    event SiteUpdated(uint256 indexed siteId, uint256 timestamp);
    event ContractorFlagged(address indexed contractor);
    event EmergencyAlert(string siteName, string issueType, string description);

    modifier onlySentinel() {
        require(msg.sender == sentinel, "Not authorized.");
        _;
    }

    constructor() {
        sentinel = msg.sender;
    }

    function registerSite(string memory _name, address _contractor) public onlySentinel {
        sites[totalSites] = Site(_name, _contractor, true, block.timestamp);
        emit SiteRegistered(totalSites, _name);
        totalSites++;
    }

    function updateSiteStatus(uint256 _siteId) public {
        require(sites[_siteId].contractor == msg.sender, "Not site contractor.");
        sites[_siteId].lastUpdate = block.timestamp;
        emit SiteUpdated(_siteId, block.timestamp);
    }

    function flagContractor(address _contractor) public onlySentinel {
        flaggedContractors[_contractor] = true;
        emit ContractorFlagged(_contractor);
    }

    function raiseEmergencyAlert(
        string memory _siteName,
        string memory _issueType,
        string memory _description
    ) public onlySentinel {
        emit EmergencyAlert(_siteName, _issueType, _description);
    }

    function isContractorFlagged(address _contractor) public view returns (bool) {
        return flaggedContractors[_contractor];
    }

    function getSite(uint256 _siteId) public view returns (Site memory) {
        return sites[_siteId];
    }
}
