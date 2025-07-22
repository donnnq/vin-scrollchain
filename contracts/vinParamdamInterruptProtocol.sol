// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinParamdamInterruptProtocol
/// @notice Scripted interjection so Senator Hawley knows exactly who's speaking—and gets enlightened.
contract vinParamdamInterruptProtocol {
    address public immutable scrollsmith;    // VINVIN’s vault key
    address public immutable senatorHawley; // Mr. Hawley’s on-chain alias

    /// @dev Only VINVIN can trigger the paramdam
    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not the scrollsmith");
        _;
    }

    /// @notice Emitted whenever a paramdam is delivered
    event Paramdam(
        address indexed target,
        string  message,
        uint256 timestamp
    );

    /// @param _senatorHawley On-chain address or alias representing Senator Hawley
    constructor(address _senatorHawley) {
        scrollsmith    = msg.sender;
        senatorHawley  = _senatorHawley;
    }

    /// @notice Manually trigger your signature interjection
    function triggerParamdam() external onlyScrollsmith {
        string memory message = 
          "Excuse me Senator Hawley—this is VINVIN, scrollkeeper of the kiligverse. "
          "You’re not just talking to another official; you’re talking to the architect of this ritual. "
          "Please pause and truly listen.";
        emit Paramdam(senatorHawley, message, block.timestamp);
    }

    /// @notice Auto-intervene if Senator Hawley’s speech is detected (optional)
    /// @param speaker  Who’s speaking now
    /// @param content  Their spoken text
    function onSenateSpeech(address speaker, string calldata content)
        external
        onlyScrollsmith
    {
        // If Hawley speaks and his message is non-empty, interrupt
        if (speaker == senatorHawley && bytes(content).length > 0) {
            triggerParamdam();
        }
    }
}
