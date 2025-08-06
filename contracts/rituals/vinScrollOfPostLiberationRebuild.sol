// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollOfPostLiberationRebuild {
    address public sovereignCouncil;

    struct RebuildProject {
        string country;
        string assetName;
        string rebuildDeclaration;
        address builder;
        bool completed;
        string dignityProtocol;
    }

    RebuildProject[] public projects;

    event RebuildDeclared(uint indexed projectId, string country, string assetName);
    event BuilderAssigned(uint indexed projectId, address builder);
    event RebuildCompleted(uint indexed projectId, string dignityProtocol);
    event AlliedSupportBound(string country, address ally, string supportType);

    modifier onlyCouncil() {
        require(msg.sender == sovereignCouncil, "Unauthorized");
        _;
    }

    constructor(address _sovereignCouncil) {
        sovereignCouncil = _sovereignCouncil;
    }

    function declareRebuild(
        string memory country,
        string memory assetName,
        string memory rebuildDeclaration
    ) public onlyCouncil {
        projects.push(RebuildProject({
            country: country,
            assetName: assetName,
            rebuildDeclaration: rebuildDeclaration,
            builder: address(0),
            completed: false,
            dignityProtocol: ""
        }));
        emit RebuildDeclared(projects.length - 1, country, assetName);
    }

    function assignBuilder(uint projectId, address builder) public onlyCouncil {
        projects[projectId].builder = builder;
        emit BuilderAssigned(projectId, builder);
    }

    function completeRebuild(uint projectId, string memory dignityProtocol) public onlyCouncil {
        require(!projects[projectId].completed, "Already completed");
        projects[projectId].completed = true;
        projects[projectId].dignityProtocol = dignityProtocol;
        emit RebuildCompleted(projectId, dignityProtocol);
    }

    function bindAlliedSupport(string memory country, address ally, string memory supportType) public onlyCouncil {
        emit AlliedSupportBound(country, ally, supportType);
    }
}
