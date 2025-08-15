// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title TelcoBlacklist
/// @notice Blocks telcos from civic contracts if they violate public trust
contract TelcoBlacklist {
    mapping(string => bool) public isBlacklisted;
    string[] public blacklistedTelcos;

    event TelcoBlacklisted(string telcoName);
    event TelcoUnblacklisted(string telcoName);

    function blacklist(string memory _telcoName) public {
        require(!isBlacklisted[_telcoName], "Already blacklisted");
        isBlacklisted[_telcoName] = true;
        blacklistedTelcos.push(_telcoName);
        emit TelcoBlacklisted(_telcoName);
    }

    function unblacklist(string memory _telcoName) public {
        require(isBlacklisted[_telcoName], "Not blacklisted");
        isBlacklisted[_telcoName] = false;
        emit TelcoUnblacklisted(_telcoName);
    }

    function getBlacklist() public view returns (string[] memory) {
        return blacklistedTelcos;
    }
}
