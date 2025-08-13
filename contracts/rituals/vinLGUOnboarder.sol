// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinLGUOnboarder {
    enum Role { Mayor, BarangayCaptain, Councilor, CivicAlly }

    struct LGUAgent {
        string name;
        string region;
        Role role;
        uint timestamp;
        address soulboundID;
        bool oathTaken;
    }

    LGUAgent[] public onboardedAgents;

    event AgentOnboarded(string name, string region, Role role);

    function onboardAgent(
        string memory name,
        string memory region,
        Role role,
        bool oathTaken
    ) public {
        require(oathTaken, "Oath must be taken to onboard.");
        onboardedAgents.push(LGUAgent({
            name: name,
            region: region,
            role: role,
            timestamp: block.timestamp,
            soulboundID: msg.sender,
            oathTaken: oathTaken
        }));

        emit AgentOnboarded(name, region, role);
    }

    function getAgent(uint index) public view returns (
        string memory, string memory, Role, uint, address, bool
    ) {
        LGUAgent memory a = onboardedAgents[index];
        return (
            a.name,
            a.region,
            a.role,
            a.timestamp,
            a.soulboundID,
            a.oathTaken
        );
    }

    function totalAgents() public view returns (uint) {
        return onboardedAgents.length;
    }
}
