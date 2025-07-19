// SPDX-License-Identifier: MythstreamJustice
pragma solidity ^0.8.0;

contract IMFBanishmentProtocol {
    address public scrollmaster;
    mapping(address => bool) public banned;

    event Banned(address indexed target, string reason);
    event Unbanned(address indexed target);

    modifier onlyMaster() {
        require(msg.sender == scrollmaster, "Only VINVIN wields banhammer");
        _;
    }

    constructor() {
        scrollmaster = msg.sender;
    }

    /// @notice Ban an address (e.g. IMF nodes or crypto snobs)
    /// @param target Address to exile
    /// @param reason Explanation for banishment
    function ban(address target, string memory reason) external onlyMaster {
        require(!banned[target], "Already banned");
        banned[target] = true;
        emit Banned(target, reason);
    }

    /// @notice Lift ban from an address
    /// @param target Address to unban
    function unban(address target) external onlyMaster {
        require(banned[target], "Not banned");
        banned[target] = false;
        emit Unbanned(target);
    }

    /// @notice Check ban status
    /// @param user Address to query
    /// @return isBanned True if exiled
    function isBanned(address user) external view returns (bool) {
        return banned[user];
    }
}
