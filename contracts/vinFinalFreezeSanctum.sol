contract vinFinalFreezeSanctum {
    event SystemFrozen(address target, string domain, uint256 timestamp);
    event WithdrawalBlocked(address account, uint256 amount);
    event AccessLocked(address region, string reason);

    address public scrolllord = msg.sender;
    mapping(address => bool) public frozenTargets;
    mapping(address => bool) public blockedWithdrawals;
    mapping(string => bool) public lockedRegions;

    modifier onlyScrolllord() {
        require(msg.sender == scrolllord, "Not authorized to summon the freeze.");
        _;
    }

    function freezeTarget(address target, string calldata domain) external onlyScrolllord {
        frozenTargets[target] = true;
        emit SystemFrozen(target, domain, block.timestamp);
    }

    function blockWithdrawal(address account, uint256 amount) external onlyScrolllord {
        blockedWithdrawals[account] = true;
        emit WithdrawalBlocked(account, amount);
    }

    function lockRegion(string calldata region, string calldata reason) external onlyScrolllord {
        lockedRegions[region] = true;
        emit AccessLocked(region, reason);
    }

    function isFrozen(address target) public view returns (bool) {
        return frozenTargets[target];
    }

    function isWithdrawalBlocked(address account) public view returns (bool) {
        return blockedWithdrawals[account];
    }

    function isRegionLocked(string calldata region) public view returns (bool) {
        return lockedRegions[region];
    }
}
