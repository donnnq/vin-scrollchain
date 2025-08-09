// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IUnifiedResolve {
    function getContributors(bytes32 problemId) external view returns (address[] memory);
    function problems(bytes32 problemId) external view returns (
        string memory description,
        string memory location,
        address initiator,
        bool resolved,
        address[] memory contributors,
        address[] memory recruits
    );
}

contract GlyphReward {
    address public oracle;
    IUnifiedResolve public unifiedResolve;

    mapping(address => uint256) public glyphBalance;
    mapping(bytes32 => bool) public rewarded;

    event GlyphIssued(address indexed contributor, uint256 amount, bytes32 problemId);

    modifier onlyOracle() {
        require(msg.sender == oracle, "Only oracle can issue rewards");
        _;
    }

    constructor(address _oracle, address _unifiedResolve) {
        oracle = _oracle;
        unifiedResolve = IUnifiedResolve(_unifiedResolve);
    }

    function issueGlyphs(bytes32 problemId, uint256 amountPerContributor) external onlyOracle {
        require(!rewarded[problemId], "Already rewarded");
        (, , , bool resolved, , ) = unifiedResolve.problems(problemId);
        require(resolved, "Problem not yet resolved");

        address[] memory contributors = unifiedResolve.getContributors(problemId);
        for (uint256 i = 0; i < contributors.length; i++) {
            glyphBalance[contributors[i]] += amountPerContributor;
            emit GlyphIssued(contributors[i], amountPerContributor, problemId);
        }

        rewarded[problemId] = true;
    }

    function getGlyphBalance(address contributor) external view returns (uint256) {
        return glyphBalance[contributor];
    }
}
