#ifndef ORION_RENDERER_RENDERER
#define ORION_RENDERER_RENDERER

#include <Renderer/RenderGraph.h>

#include <Context/RenderingContext.h>

namespace Orion
{
	class Renderer
	{
	public:
		Renderer() = default;
		~Renderer() = default;

	private:

		RenderGraph m_RenderGraph;

		RenderingContext m_RenderingContext;
	};
}

#endif // ORION_RENDERER_RENDERER