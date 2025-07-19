// SPDX-License-Identifier: MythstreamJustice
pragma solidity ^0.8.0;

contract BitcoinRespectEnforcer {
    address public scrollmaster;
    mapping(address => uint8) public violationCount;
    mapping(address => bool) public banned;

    event StrikeIssued(address indexed offender, uint8 level, string reason);
    event AccountTerminated(address indexed offender);

    modifier onlyMaster() {
        require(msg.sender == scrollmaster, "Only VINVIN can enforce rules");
        _;
    }

    constructor() {
        scrollmaster = msg.sender;
    }

    /// @notice Issue a strike for disrespecting Bitcoin
    /// @param offender Address of the violator
    /// @param reason Short description of the offence
    function issueStrike(address offender, string memory reason) public onlyMaster {
        require(!banned[offender], "Account already terminated");
        violationCount[offender] += 1;
        emit StrikeIssued(offender, violationCount[offender], reason);

        // On third strike, ban forever
        if (violationCount[offender] >= 3) {
            banned[offender] = true;
            emit AccountTerminated(offender);
        }
    }

    /// @notice Check how many strikes and ban status
    /// @param user Address to query
    /// @return strikes Number of strikes issued
    /// @return isBanned Whether the account is terminated
    function getStatus(address user) external view returns (uint8 strikes, bool isBanned) {
        return (violationCount[user], banned[user]);
    }
}
