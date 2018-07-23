	<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
		<PropertyGroup>
			<ProjectGuid>{90B0C2B6-9AFB-4B75-A7A5-7E9638F42BE5}</ProjectGuid>
		</PropertyGroup>
		<ItemGroup>
			<Projects Include="ProjetoMVC.dproj">
				<Dependencies/>
			</Projects>
		</ItemGroup>
		<ProjectExtensions>
			<Borland.Personality>Default.Personality.12</Borland.Personality>
			<Borland.ProjectType/>
			<BorlandProject>
				<Default.Personality/>
			</BorlandProject>
		</ProjectExtensions>
		<Target Name="ProjetoMVC">
			<MSBuild Projects="ProjetoMVC.dproj"/>
		</Target>
		<Target Name="ProjetoMVC:Clean">
			<MSBuild Targets="Clean" Projects="ProjetoMVC.dproj"/>
		</Target>
		<Target Name="ProjetoMVC:Make">
			<MSBuild Targets="Make" Projects="ProjetoMVC.dproj"/>
		</Target>
		<Target Name="Build">
			<CallTarget Targets="ProjetoMVC"/>
		</Target>
		<Target Name="Clean">
			<CallTarget Targets="ProjetoMVC:Clean"/>
		</Target>
		<Target Name="Make">
			<CallTarget Targets="ProjetoMVC:Make"/>
		</Target>
		<Import Project="$(BDS)\Bin\CodeGear.Group.Targets" Condition="Exists('$(BDS)\Bin\CodeGear.Group.Targets')"/>
	</Project>
