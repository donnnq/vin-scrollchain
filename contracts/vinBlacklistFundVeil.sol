contract vinBlacklistFundVeil {
    event RegionBlacklisted(string region);
    event AccessRevoked(address previousRecipient);

    address public scrolllord = msg.sender;
    mapping(string => bool) public blacklistedRegions;
    mapping(address => bool) public revokedAddresses;

    modifier onlyScrolllord() {
        require(msg.sender == scrolllord, "Scroll access denied.");
        _;
    }

    function blacklistRegion(string calldata region) external onlyScrolllord {
        blacklistedRegions[region] = true;
        emit RegionBlacklisted(region);
    }

    function revokeAccess(address recipient) external onlyScrolllord {
        revokedAddresses[recipient] = true;
        emit AccessRevoked(recipient);
    }

    function isBlacklisted(string calldata region) public view returns (bool) {
        return blacklistedRegions[region];
    }

    function isRevoked(address recipient) public view returns (bool) {
        return revokedAddresses[recipient];
    }
}
