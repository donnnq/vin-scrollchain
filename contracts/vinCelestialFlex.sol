// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinCelestialFlex {
    struct ConstellationSignal {
        string glyphName;
        string sourceOrigin;
        string emotionalCharge;
        string cosmicAlignment;
        uint256 flexIntensity;
    }

    ConstellationSignal[] public skySignals;
    address public cosmicOperator;

    event FlexSignalBroadcasted(string glyphName, string alignment, string charge, uint256 intensity);
    event CosmicRippleEchoed(string interpretation, uint256 magnitude);

    modifier onlyOperator() {
        require(msg.sender == cosmicOperator, "Unauthorized cosmic signal");
        _;
    }

    constructor(address _operator) {
        cosmicOperator = _operator;
    }

    function broadcastFlexSignal(
        string memory glyphName,
        string memory sourceOrigin,
        string memory emotionalCharge,
        string memory cosmicAlignment,
        uint256 flexIntensity
    ) external onlyOperator {
        skySignals.push(ConstellationSignal(glyphName, sourceOrigin, emotionalCharge, cosmicAlignment, flexIntensity));
        emit FlexSignalBroadcasted(glyphName, cosmicAlignment, emotionalCharge, flexIntensity);
    }

    function echoCosmicRipple(string memory interpretation, uint256 magnitude) external onlyOperator {
        emit CosmicRippleEchoed(interpretation, magnitude);
    }
}
