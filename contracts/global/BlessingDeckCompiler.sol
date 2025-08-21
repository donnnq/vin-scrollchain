// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckCompiler {
    struct AuditDelta {
        string country;
        string steward;
        uint256 aprBefore;
        uint256 aprAfter;
        string blessingType;
        bool scrollGenerated;
        uint256 timestamp;
    }

    AuditDelta[] public compiledScrolls;

    event ScrollCompiled(string steward, string blessingType, uint256 aprBefore, uint256 aprAfter);

    function compileScroll(
        string memory _country,
        string memory _steward,
        uint256 _aprBefore,
        uint256 _aprAfter,
        string memory _blessingType
    ) public {
        require(_aprAfter > _aprBefore, "Blessing requires positive APR delta");

        compiledScrolls.push(AuditDelta({
            country: _country,
            steward: _steward,
            aprBefore: _aprBefore,
            aprAfter: _aprAfter,
            blessingType: _blessingType,
            scrollGenerated: true,
            timestamp: block.timestamp
        }));

        emit ScrollCompiled(_steward, _blessingType, _aprBefore, _aprAfter);
    }

    function getCompiledScrolls() public view returns (AuditDelta[] memory) {
        return compiledScrolls;
    }
}
